<div align="center">
   <a href="https://www.amazon.com.br/s?k=alexa"><img src="https://img.shields.io/badge/-Alexa-00CAFF?style=flat-square&logo=amazon-alexa&logoColor=white"></a>
   <a href="https://www.home-assistant.io/"><img src="https://img.shields.io/badge/-Home%20Assistant-41BDF5?style=flat-square&logo=home-assistant&logoColor=white"></a>
   <a href="https://www.hivemq.com/"><img src="https://img.shields.io/badge/HiveMQ-black?style=flat-square&logo=hive&logoColor=yellow"></a>
</div>

## **🤖 Projeto**

Neste projeto vamos executar comandos em um sistema operacional Linux via comando de voz através do assistente virtual Alexa. Foi construído uma skill Alexa que se conecta a um cluster MQTT no [HIVEMQ](https://www.hivemq.com/hivemq/mqtt-broker/) e **publica** mensagens em alguns tópicos. Por outro lado, foi construído um script em shell que roda localmente em um computador, e que também se conecta a esse cluster no [HIVEMQ](https://www.hivemq.com/hivemq/mqtt-broker/) e se **subscreve** em alguns tópicos. Desta forma, ao chegar a mensagem:

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

1. Faça login com GMAIL e crie um cluster MQTT no [HIVEMQ](https://www.hivemq.com/hivemq/mqtt-broker/).
   <br/>

2. Na pasta [skill](./skill/) entre em lambda, renomeie o arquivo _.env.example_ para _.env_ , entre com as credenciais de seu cluster. Agora entre com sua conta Amazon, acesse o [Alexa Developer Console ](https://developer.amazon.com/alexa/console/) e importe a skill.
   <br/>

3. Na skill importada, clique na aba **Test**, e no campo **Skill testing is enabled in** e ative o modo Development. Acesse o campo **Code** e faça Deploy.
   <br/>

4. Em seu sistema operacional Linux, copie a **pasta script** para o diretório _/opt_, renomeie o arquivo _.env.example_ para _.env_ entre com as credenciais de seu cluster.
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
