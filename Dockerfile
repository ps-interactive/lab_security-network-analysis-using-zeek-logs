FROM zeek/zeek:latest

RUN /bin/bash -c 'useradd -m -s /bin/bash globolab'
RUN /bin/bash -c 'mkdir /home/globolab/labs'
RUN /bin/bash -c 'mkdir /home/globolab/labs/lab1'
RUN /bin/bash -c 'mkdir /home/globolab/labs/lab2'
RUN /bin/bash -c 'mkdir /home/globolab/labs/lab3'
RUN /bin/bash -c 'mkdir /home/globolab/labs/lab4'
RUN echo 'alias ll="ls -la"' >> /home/globolab/.bashrc
RUN echo 'alias clean="rm -rf *.log; rm -rf extract_files/"' >> /home/globolab/.bashrc
RUN echo 'export PATH="/usr/local/zeek/bin:$PATH"' >> /etc/profile 

COPY [--chown=globolab:globolab] ./lab1.pcap /home/globolab/labs/lab1/lab1.pcap
COPY [--chown=globolab:globolab] ./lab2.pcap /home/globolab/labs/lab2/lab2.pcap
COPY [--chown=globolab:globolab] ./lab3.pcap /home/globolab/labs/lab3/lab3.pcap
COPY [--chown=globolab:globolab] ./intel.dat /home/globolab/labs/lab4/intel.dat
COPY [--chown=globolab:globolab] ./local.zeek /home/globolab/labs/local.zeek
COPY [--chown=globolab:globolab] ./startup.sh /etc/init.d/startup.sh

RUN /bin/bash -c 'chown -R globolab:globolab /home/globolab/labs'
RUN /bin/bash -c 'chmod +x /etc/init.d/startup.sh'
RUN /bin/bash -c 'sh /etc/init.d/startup.sh'
RUN /bin/bash -c 'chmod 777 /usr/local/zeek/share/zeek/policy/frameworks/intel/do_notice.zeek'
