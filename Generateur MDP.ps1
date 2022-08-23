Write-Output "`n","Generateur de mots de passe personnaliser","`n"
$DLETTREMAJ = 1  #Nombre de lettre(s) en Majuscule par défauts
$Dlettremin = 2  #Nombre de lettre(s) en Minuscule par défauts
$DNombre = 5 #Nombre de nombre Par défauts
$Dcaratere = 0  #Nombre de caratere special par défauts
$Dmdplong = 10  #Nombre de mot(s) de passe a générer par défauts
$DAlea = "N" #mot(s) de passe ecrit alatoirement par défauts

if (!($LETTREMAJ = Read-Host "Nombre de lettre(s) en Majuscule | Par défauts $DLETTREMAJ")) { $LETTREMAJ = $DLETTREMAJ }
if (!($lettremin = Read-Host "Nombre de lettre(s) en Minuscule | Par défauts $Dlettremin")) { $lettremin = $Dlettremin }
if (!($Nombre = Read-Host "Combien de nombre | Par défauts $DNombre")) { $Nombre = $DNombre }
if (!($caratere = Read-Host "Combien de caratere special | Par défauts $Dcaratere")) { $caratere = $Dcaratere }
if (!($mdplong = Read-Host "Nombre de mot(s) de passe a générer | Par défauts $Dmdplong")) { $mdplong = $Dmdplong }
if (!($Alea = Read-Host " mot(s) de passe ecrit alatoirement (Y or N)  | Par défauts $DAlea")) { $Alea = $DAlea }

$mdplong = $mdplong - 1
# ⚠⚠
$Creationfile = " REMPLACER PAR LE CHEMIN \mdp.txt" #⚠ CHOISIR LE CHEMIN DU REPERTOIRE OU CE CREA LE FICHIER TXT OU CSV ⚠
# ⚠⚠
$uppercase = "ABCDEFGHKLMNOPRSTUVWXYZ".tochararray() 
$lowercase = "abcdefghiklmnoprstuvwxyz".tochararray() 
$number = "0123456789".tochararray() 
$special = "$%&/=?@#*+!".tochararray() 

For ($i=0; $i -le $mdplong; $i++) { #Nombre de mots de passe a générer

If($LETTREMAJ -eq "0") 
{ 
}else{$password =($uppercase | Get-Random -count $LETTREMAJ) -join ''}#NOMBRE DE LETTRE EN MAJ}

If($lettremin -eq "0") 
{ 
}else{  $password +=($lowercase | Get-Random -count $lettremin) -join ''}#nombre de letre en min}

If($Nombre -eq "0") 
{ 
}else{  $password +=($number | Get-Random -count $Nombre ) -join ''}#nombre de nombre}

If($caratere -eq "0") 
{ 
}else{  $password +=($special | Get-Random -count $caratere) -join ''}#nombre de caractere}

$passwordarray=$password
$scrambledpassword=($passwordarray | Get-Random -Count 8) -join ''

If($Alea -eq "Y") 
{ 

$passwordarray=$password.tochararray()
$scrambledpassword=($passwordarray | Get-Random -Count 8) -join ''
$scrambledpassword

}else{  $scrambledpassword

$passwordarray=$password
$scrambledpassword=($passwordarray | Get-Random -Count 8) -join ''
$scrambledpassword

ADD-content -path $Creationfile $scrambledpassword }#choisir l'emplacement de la creation du fichier et lui donne un nom soit avec un .txt ou csv
}
$mdplong = $mdplong + 1
Write-Output "Vous avez cree $mdplong Mots de passe, le fichier texte se trouve $Creationfile"