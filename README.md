<div align="center">
<img src="https://img.shields.io/badge/amazon%20alexa-52b5f7?style=for-the-badge&logo=amazon%20alexa&logoColor=white" alt="Alexa" />    
</div>

<div align="center">
<img src="https://img.shields.io/badge/shell_script-%23121011.svg?style=for-the-badge&logo=gnu-bash&logoColor=white" alt="shell-script"/>  
</div>

<div align="center">
<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPCclc4DOkgDZ2ZoD1A9V-4pEjRM0KGNjscP25dp3L&s" alt="shell-script" width="150px"/>  
</div>

## **🤖 Projeto**

Neste projeto vamos executar comandos em um sistema operacional Linux via comando de voz através do assistente virtual Alexa. Foi construído uma skill Alexa que se conecta a uma conta no broker [HIVEMQ](https://www.hivemq.com/hivemq/mqtt-broker/) e **publica** mensagens em alguns tópicos. Por outro lado, foi construído um script em shell que roda localmente em um computador, e que também se conecta a essa mesma conta no broker [HIVEMQ](https://www.hivemq.com/hivemq/mqtt-broker/) e se **subscreve** em alguns tópicos. Desta forma, ao chegar a mensagem:

```json
{
  "cmd": "on"
}
```

no tópico:

```txt
computador/turnOff
```

o computador é desligado.

## 🚀 Get Started

1. Crie uma conta no [HIVEMQ](https://www.hivemq.com/hivemq/mqtt-broker/).
   <br/>

2. Na pasta [skill](./skill/) entre em lambda, renomeie o arquivo _.env.example_ para _.env_ , entre com as credenciais de sua conta [HIVEMQ](https://www.hivemq.com/hivemq/mqtt-broker/). Agora entre com sua conta Amazon, acesse o [Alexa Developer Console ](https://developer.amazon.com/alexa/console/) e importe a skill.
   <br/>

3. Na skill importada, clique na aba **Test**, e no campo **Skill testing is enabled in** e ative o modo Development. Acesse o campo **Code** e faça Deploy.
   <br/>

4. Em seu sistema operacional Linux, copie a **pasta script** para o diretório _/opt_, renomeie o arquivo _.env.example_ para _.env_ entre com as credenciais de sua conta [HIVEMQ](https://www.hivemq.com/hivemq/mqtt-broker/).
   <br/>

5. Copie o arquivo [alexa-shell.service](./alexa-shell.service) para o diretório /etc/systemd/system e execute os seguintes comandos:

```bash
sudo systemctl daemon-reload
sudo systemctl enable alexa-shell
sudo systemctl start alexa-shell
```

Se tudo estiver ok, ao digitar o comando:

```bash
sudo systemctl status alexa-shell
```

O status deve estar ativo.

Para ativar a Skill, diga:

```txt
"Alexa, controlar computador"
```

A Alexa ira responder:

```
"O que deseja ?"
```

Você poderá dizer:

1. Desligar
2. Hibernar
3. Reiniciar

## **🙂 Observação**

Você deverá instalar o **mosquitto**, **mosquitto_clients** e **jq** em seu Linux.

```bash
sudo apt install mosquitto mosquitto_clients jq -y
```

## **🌞 Considerações**

Rode a Skill em modo de desenvolvimento, não submeta a skill para Amazon.

## **📝 License**

Este projeto possui [licença](LICENSE.md) do tipo MIT.
