# Define o link para o script .bat
$url = "https://github.com/gloomycrow/ATP/releases/download/ATP/ATP.bat"

# Define o caminho onde o script será salvo localmente
$outputPath = "$env:TEMP\ATP.bat"

# Baixa o script do link
try {
    Invoke-WebRequest -Uri $url -OutFile $outputPath
    Write-Host "Script baixado com sucesso para: $outputPath"
} catch {
    Write-Error "Erro ao baixar o script: $($_.Exception.Message)"
    exit
}

# Executa o script baixado no cmd como administrador
try {
    Start-Process -FilePath "cmd" -ArgumentList "/c ""$outputPath""" -Verb RunAs
    Write-Host "Script executado com sucesso como administrador."
} catch {
    Write-Error "Erro ao executar o script: $($_.Exception.Message)"
