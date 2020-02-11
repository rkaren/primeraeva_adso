Write-Output "Introduce 2 numeros para hacer operaciones"
Write-Output "dime el primer elemento: "
$uno = Read-Host
Write-Output "dime el segundo elemento: "
$dos = Read-Host
if($uno -gt $dos){
#Write-Output "El numero: $numero1 es mayor que $numero2"
    $mayor = [int]$uno
    $menor = [int]$dos
 }
if($uno -lt $dos){
    $mayor = [int]$dos
    $menor = [int]$uno
 }
 echo "la sucesion aritmetico geometrica para los siguientes 6 elementos es:"
 echo $menor $mayor
 [int]$suma =[int] $mayor + $menor
for($j = 1; $j -lt 6; $j++){            
 $auxiliar = $mayor * $menor
 [int]$suma = [int]$suma + [int]$auxiliar
  $menor = $mayor
  $mayor = $auxiliar
  echo $auxiliar
}
 echo 'La suma es: ' $suma