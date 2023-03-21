# Este código contém comandos para instalar pacotes no Azure ML
# Este codigo foi criado para executar tanto no Azure, quanto no RStudio.
# Para executar no Azure, altere o valor da variavel Azure para TRUE. Se o valor for FALSE, o codigo sera executado no RStudio.

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
# setwd("C:/FCD/BigDataRAzure/Cap13")
# getwd()

# Variável que controla a execução do script
Azure <- TRUE

if(Azure){
  # Instala o pacote tidyr e as dependências tibble e rlang a partir do arquivo zip
  install.packages("src/rlang_0.3.1.zip", lib = ".", repos = NULL, verbose = TRUE)
  install.packages("src/tibble_2.0.1.zip", lib = ".", repos = NULL, verbose = TRUE)
  install.packages("src/tidyr_0.8.2.zip", lib = ".", repos = NULL, verbose = TRUE)
  
  require(tibble, lib.loc = ".")
  require(rlang, lib.loc = ".")
  require(tidyr, lib.loc = ".")
}else{
  install.packages("tidyr")
  require(tidyr)
}

if(Azure) maml.mapOutputPort("dataset")
