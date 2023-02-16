<div align="center">
   <a href="https://www.amazon.com.br/s?k=alexa"><img src="https://img.shields.io/badge/-Alexa-00CAFF?style=flat-square&logo=amazon-alexa&logoColor=white"></a>
   <a href="https://www.home-assistant.io/"><img src="https://img.shields.io/badge/-Home%20Assistant-41BDF5?style=flat-square&logo=home-assistant&logoColor=white"></a>
   <a href="https://www.hivemq.com/"><img src="https://img.shields.io/badge/HiveMQ-black?style=flat-square&logo=hive&logoColor=yellow"></a>
</div>

## **🤖 Projeto**

NNeste projeto, você pode usar a Alexa para controlar seu computador por meio de comandos de voz.. Foi construído uma skill Alexa que se conecta a um broker MQTT no HiveMQ e publica mensagens em alguns tópicos. Por outro lado, foi construído um script em shell que roda localmente em um computador, e que também se conecta a esse broker no HiveMQ e se inscreve em alguns tópicos.receber mensagens em determinados tópicos, o script executa comandos no sistema operacional.

## 🚀 Get Started

1. Crie uma conta e uma conta e um cluster mqtt no HiveMQ

2. Na pasta [skill](./skill/) entre em lambda, renomeie o arquivo _.env.example_ para _.env_ , entre com as credenciais de seu cluster

3. Agora entre com sua conta Amazon, acesse o [Alexa Developer Console ](https://developer.amazon.com/alexa/console/), crie uma nova skill

4. Clique na nova skill criada, no campo code, importe a pasta [skill](./skill/), em formato zip

5. Clique na skill, build, Intents, JSON Editor, cole o conteúdo do arquivo [pt-BR.json](./skill/interactionModels/custom/pt-BR.json)

6. Na skill importada, clique na aba **Test**, e no campo **Skill testing is enabled in** e ative o modo Development. Acesse o campo **Code** e faça Deploy.

7. Em seu sistema operacional Linux, copie a **pasta script** para o diretório _/opt_, renomeie o arquivo _.env.example_ para _.env_ entre com as credenciais de seu broker mqtt que foi criado no HiveMQ
   <br/>

8. Copie o arquivo [alexa-shell.service](./alexa-shell.service) para o diretório /etc/systemd/system e execute os seguintes comandos:

```bash
sudo systemctl daemon-reload
sudo systemctl enable alexa-shell
sudo systemctl start alexa-shell
```

Para ativar a Skill, diga:

```txt
ALEXA CONTROLAR COMPUTADOR
```

Ela ira responder:

```
O QUE DESEJA?
```

Você poderá dizer:

1. `Desligar`
2. `Hibernar`
3. `Reiniciar`

## **🙂 Observação**

Você deverá instalar o **mosquitto**, **mosquitto_clients** e **jq** em seu Linux.

```bash
sudo apt install mosquitto mosquitto_clients jq -y
```

## **🌞 Considerações**

Rode a Skill em modo de desenvolvimento, não submeta a skill para Amazon.

## **📝 License**

Este projeto possui [licença](LICENSE.md) do tipo MIT.

## 📞 Contato

<a href="https://github.com/tpaphysics">
  <img src="https://avatars.githubusercontent.com/u/46402647?s=400&u=5b00ec492908116235f3d0c6eee80b94840b2339&v=4" alt="Foto de perfil" width="80" style="border-radius:50%">
</a>
<br>
<a href="mailto:physics.posgrad@gmail.com">
  <img src="https://img.shields.io/badge/Email-Gmail-D14836?style=flat&logo=gmail&logoColor=white" alt="Email">
</a>
<br>

<a href="seulinkedin.com">
  <img src="https://img.shields.io/badge/LinkedIn-Profile-0077B5?style=flat&logo=linkedin&logoColor=white" alt="LinkedIn">
</a>
