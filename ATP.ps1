# Início do Script PowerShell

# ----------------------------------------------------
# Configuração
# ----------------------------------------------------

# URL do arquivo a ser baixado
$DownloadUrl = 'https://github.com/gloomycrow/AIO_Tec_Project/releases/download/ATP/ATP.exe'

# Define o caminho completo onde o arquivo será salvo (pasta TEMP do Windows)
$LocalPath = "$env:TEMP\ATP.exe"

# ----------------------------------------------------
# Execução
# ----------------------------------------------------

# 1. Baixa o arquivo usando o Invoke-WebRequest (iwr)
Write-Host "Iniciando o download de '$DownloadUrl'..." -ForegroundColor Cyan

try {
    # -OutFile (-o) especifica o caminho local para salvar o arquivo.
    Invoke-WebRequest -Uri $DownloadUrl -OutFile $LocalPath -ErrorAction Stop

    Write-Host "Download concluído com sucesso. Arquivo salvo em '$LocalPath'." -ForegroundColor Green
    
    # 2. Inicia o arquivo baixado
    Write-Host "Iniciando a execução do arquivo '$LocalPath'..." -ForegroundColor Yellow
    
    # Start-Process (start) executa o programa.
    # O switch -Wait faria o script esperar a execução, mas o 'start' simples
    # executa em segundo plano para que o script possa fechar imediatamente.
    Start-Process -FilePath $LocalPath
    
    Write-Host "Execução iniciada." -ForegroundColor Green
    
}
catch {
    # 3. Tratamento de erro caso o download falhe
    Write-Host "ERRO: Falha durante o download ou acesso ao arquivo." -ForegroundColor Red
    Write-Host $_.Exception.Message -ForegroundColor Red
}

# ----------------------------------------------------
# Finalização
# ----------------------------------------------------

# 4. Encerra a sessão atual do PowerShell, fechando a janela
Write-Host "Encerrando a sessão do PowerShell..." -ForegroundColor DarkGray
Exit
