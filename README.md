# Especialização em Engenharia de Software - DevOps

## Disciplina de Infraestrutura como o Código

###  Implantação de uma aplicação web na nuvem, usando Terraform

#### Solução: 
1 - Provedor Cloud: AWS

2 - Grupos de Segurança:

    * mysql-sg 
        Entrada: Mysql/Aurora:3306 com permissão para api-sg
    * api-sg 
        Entrada: 22, 80
        aída: Todo tráfego
    * api-lb
        Entrada  : Todo tráfego
        Saída: Todo tráfego

3 - EC2: T2 Micro Free Tier

    * Sistema Operacional: Ubuntu 24.04
        Servidor Web: Nginx
        Php8.3, Php8.3-fpm, mysql-client, wordpress

4 - RDS: MYSQL 8.0.35

    * Banco de dados: wordpress
5 - Load Balance

    * Grupo de Destino (apiTargetGroup) 
    * Load Balance - ALB (voltado para internet e todas sub redes disponíveis)
    * Adicção do grupo de destino: apiTargetGroup:80
