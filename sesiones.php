<?php 
session_set_cookie_params([//esta asi por que se ve en el localhost
    'lifetime' => 0,
    'path'     => '/',
    'domain'   => '', 
    'secure'   => false,      
    'httponly' => true,       
    'samesite' => 'Lax'
]);
session_start();
include_once "../conexion.php";
// Versión mejorada que bloquea a los baneados (asumiendo que 1 significa baneado)

function cookies($id_usuario){
    global $conexion;
    $selector=bin2hex(random_bytes(6));
    $validador=bin2hex(random_bytes(32));
    $tiempo_expiracion = time()+(86400*30);
    $fecha_expiracion=date("Y-m-d H:i:s",$tiempo_expiracion);
    $sql="INSERT INTO sesiones(id_usuario,selector,token_hash,expiracion)
        values(:id_usuario,:selector,:token_hash,:expiracion)";
        $consulta=$conexion->prepare($sql);
        $consulta->execute([
            "id_usuario"=>$id_usuario,
            "selector"=>$selector,
            "token_hash"=>hash("sha256",$validador),
            "expiracion"=>$fecha_expiracion
        ]);
        setcookie(
            'recuerdame',
            $selector . ':' . $validador,
            $tiempo_expiracion,
            '/',
            '',      
            false,//esta asi por que se ve en el localhost
            true     
        );
}


function login($id, $username){ 
    session_regenerate_id(true);
    $_SESSION["id"]=$id;
    $_SESSION["username"]=$username;
    $_SESSION["direccion_ip"]=$_SERVER["REMOTE_ADDR"]; 
}



function reconectar() {
    global $conexion;
    
    if (isset($_SESSION['id'])) {
        if ($_SESSION['direccion_ip'] !== $_SERVER['REMOTE_ADDR']) {
            desconexion();    
        }
        return;
    }
    if(!empty($_COOKIE["recuerdame"])){
        $partes=explode(":",$_COOKIE["recuerdame"]);//esto era para ver sie el formato de la cookie es correcto
        if(count($partes)!==2)return;
        list($selector, $validador) = $partes;
        try{
            $sql="SELECT id_usuario, token_hash FROM sesiones
            WHERE selector= :selector AND expiracion >NOW() LIMIT 1";
            $consulta=$conexion->prepare($sql);
            $consulta->execute(["selector"=>$selector]);
            $token_db=$consulta->fetch(PDO::FETCH_ASSOC);
            if($token_db&&  hash_equals($token_db['token_hash'],hash("sha256", $validador))){
                $consulta_usuario = $conexion->prepare("SELECT nombre FROM usuario WHERE id_usuario = :id AND ban_cuenta = 0 LIMIT 1");
                $consulta_usuario->execute(["id"=>$token_db["id_usuario"]]);
                $usuario=$consulta_usuario->fetch(PDO::FETCH_ASSOC);
                if($usuario){
                    login($token_db["id_usuario"],$usuario["nombre"]);
                    header("Location: " . $_SERVER['PHP_SELF']);
                    exit();
                }
            }
            
        }catch(PDOException $e){
            echo $e;
        }
        
    }
}
function desconexion(){
    global $conexion;
    if(!empty($_COOKIE["recuerdame"])){//donde se borra la cookie
        $selector=explode(":",$_COOKIE["recuerdame"])[0];
        $sql="DELETE FROM sesiones WHERE selector =:selector";
        $consulta=$conexion->prepare($sql);
        $consulta->execute(["selector"=>$selector]);
        setcookie("recuerdame","",time()-3600,"/");
    }


    $_SESSION=[];//donde se borra la sesion
    if(ini_get("session.use_cookies")){
        $params=session_get_cookie_params();
        setcookie(
            session_name(),
            "",
            time()-42000,
            $params["path"], 
            $params["domain"],
            $params["secure"], 
            $params["httponly"]
            );
        }
            session_destroy();
            header("Location: ../formularios/formulario.php");
            exit();  
}
?>