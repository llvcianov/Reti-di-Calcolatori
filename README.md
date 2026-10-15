# Raccolta e Analisi di Tracce di Traffico di Applicazioni Mobili

Elaborato d'esame per il corso di **Fondamenti di Reti di Calcolatori** (Prof. Antonio Pescapè), Laurea Triennale in Ingegneria Informatica, Università di Napoli Federico II — A.A. 2022/2023.

Progetto di gruppo (4 persone), svolto presso l'ARC LAB della Federico II.

## Di cosa tratta

L'elaborato analizza il traffico di rete generato da applicazioni mobili di messaggistica, audio e video chiamata (**Discord, Google Meet, TrueConf, Jitsi Meet**), con l'obiettivo di studiare le tecniche di classificazione del traffico (port-based, packet-based, flow-based, payload-based/DPI) e applicarle a dati reali.

Fasi del lavoro:
1. **Cattura**: tramite gli strumenti dell'ARC LAB (smartphone con custom ROM, software di cattura **MIRAGE**), sono state registrate 32 sessioni di traffico (chat, audio call, video call) su due coppie di studenti connessi da reti diverse.
2. **Analisi**: le tracce catturate (file `.pcap`) sono state elaborate con **Capinfos**, **TShark** e **Whois** per estrarre informazioni generali, biflussi TCP/UDP, risoluzioni DNS, SNI di TLS, host HTTP e metadati sugli indirizzi IP.
3. **Automazione**: l'analisi è stata automatizzata con uno script bash (incluso in questo repository).

## Contenuto del repository

- [`Elaborato RDC finale.pdf`](Elaborato%20RDC%20finale.pdf) — relazione completa: introduzione, strumenti utilizzati, metodologia di cattura, analisi del traffico, risultati sperimentali e conclusioni.
- [`script.sh`](script.sh) — script di automazione dell'analisi, descritto nel Capitolo 3 della relazione. Per ciascuna traccia `traffic.pcap` produce un file `INFO.csv` con le informazioni generali (Capinfos), i biflussi TCP/UDP, DNS, SNI e host HTTP (TShark), oltre a un'analisi whois degli indirizzi IP coinvolti (richiede un file `whois_commands.log` con la lista di IP da interrogare).

Lo script richiede come input le tracce di cattura originali (`.pcap`), non incluse in questo repository.
