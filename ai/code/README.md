# tasks
- [] create a new folder structure for the models and the code
- [] run the mixtral models at rlaplnxml2
- [] test the TheBloke models
  - [] deepseek-coder-6.7B-instruct-GGUF, run at rlapstudio
  - [] Mixtral-8x7B-Instruct-v0.1-GGUF, run at rlaplnxml2
  - [] Mixtral-8x7B-v0.1-GGUF, run at rlaplnxml2
- [] test the Trelis models 
  - [] Trelis/deepseek-coder-33b-instruct-function-calling-v2, test at rlaplnxml2 and rlapstudio


# examples with python 
# conda commands
```bash
conda create -n ai-test1 python=3.11
conda activate ai-test1
conda install pip
conda deactivate
conda remove -n ai-test1 --all
``````
# install the required packages
```bash
which python
which pip
python --version
pip install -U langchain openai transformers accelerate bitsandbytes sentence_transformers flask
python -m pip install -U langchain huggingface_hub transformers accelerate bitsandbytes
python -m pip install -U sentence_transformers

pip show langchain
pip uninstall langchain
python -m pip show langchain
python load_model.py

```

# load a mml model


sudo iptables -A INPUT -p tcp --dport 80 -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 8080 -j ACCEPT
sudo iptables -L -n

Warning: Extension tcp revision 0 not supported, missing kernel module?
iptables: No chain/target/match by that name.


sudo sysctl net.ipv6.conf | grep disable_ipv6

la /etc/iptables
cat /etc/iptables/iptables.rules
sudo nvim /etc/iptables/iptables.rules
cat /etc/iptables/simple_firewall.rules

sudo nvim /etc/iptables/simple_firewall.rules
  -A INPUT -p tcp --dport 8080 -j ACCEPT

sudo iptables-restore < /etc/iptables/simple_firewall.rules

sudo nvim /etc/iptables/test_rules.rules
sudo iptables-restore < /etc/iptables/test_rules.rules
sudo iptables -L -n
# list ipv6 status
sudo sysctl net.ipv6.conf | grep disable_ipv6
sudo sysctl -w net.ipv6.conf.eno1.disable_ipv6=1
sudo systemctl restart systemd-sysctl.service
sudo systemctl status systemd-sysctl.service

sudo iptables -A INPUT -p tcp --dport 8080 -j ACCEPT
sudo iptables -L -n


nmap rlaplnxml2
nmap -p 8080 rlaplnxml2
nmap -p 4006 rlaplnxml2

sudo tcpdump -lnn -i eno1 port 8080
sudo tcpdump -lnn -i eno1 port 4006

modprobe -v xt_multiport

mmap 8080/tcp closed http-proxy
mmap closed pxc-spvr

sudo iptables -nvL --line-numbers


sudo iptables -A TCP -p tcp --dport 8080 -j ACCEPT

ACCEPT

ACCEPT

*filter