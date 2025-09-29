################################################################################################################################
#Programme pour bloquer les connexions d'adobe à ses serveurs pour éviter les mises à jours en cas de crack d'un logiciel
################################################################################################################################

Pour eviter le message "expire dans 10 jours" :

Petite astuce pour bloquer toutes les connexions de Adobe à ses serveurs :

Creer un .txt et le renomer en .bat
Editer le .txt et copiez çà (sans les guillemets):
"@ setlocal enableextensions
@ cd /d "%~dp0"
for /R %%f in (*.exe) do (
  netsh advfirewall firewall add rule name="Blocked: %%f" dir=out program="%%f" action=block
  netsh advfirewall firewall add rule name="Blocked: %%f" dir=in program="%%f" action=block
)
pause"

Deplacez et executez en mode administrateur le .bat dans le dossier Adobe present dans "Program Files"
(et eventuellement celui dans "Program Files (X86))
En gros çà rajoutes des regles de blocage in et out pour tous les .exe
presents dans ces dossiers, Pour verifier que çà à bien marché vous
pouvez allez verifier çà dans windows defender -> parametre avancés
-> Regles du trafic sortant/entrant
