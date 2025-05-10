<?php
$servername = "sql103.infinityfree.com";
$username = "if0_38647141";
$password = "oRMciSb8IKSr";
$database = "if0_38647141_chat_db";

// Conectar ao banco de dados
$conn = new mysqli($servername, $username, $password, $database);
if ($conn->connect_error) {
    die("Conexão falhou: " . $conn->connect_error);
}

// Verifica se está recebendo uma mensagem
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $usuario = $_POST["usuario"];
    $mensagem = $_POST["mensagem"];

    $sql = "INSERT INTO chat (usuario, mensagem) VALUES ('$usuario', '$mensagem')";
    if ($conn->query($sql) === TRUE) {
        echo "Mensagem enviada!";
    } else {
        echo "Erro: " . $conn->error;
    }
} else {
    // Exibe mensagens do chat
    $sql = "SELECT usuario, mensagem, data_envio FROM chat ORDER BY id DESC LIMIT 10";
    $result = $conn->query($sql);
    
    while ($row = $result->fetch_assoc()) {
        echo "[" . $row["data_envio"] . "] " . $row["usuario"] . ": " . $row["mensagem"] . "<br>";
    }
}

$conn->close();
?>