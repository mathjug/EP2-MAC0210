modo = input("Deseja executar o programa com...\n (1) Função\n (2) Imagem pronta\nSua resposta: ");
if (modo == 1)
  p = input("Quantos pixels? ");
  disp("Qual função deseja usar?")
  disp(" (1) f(x,y) = (sen(x), (sen(y) + sen(x)) / 2, sen(x))")
  disp(" (2) f(x,y) = (1 / (1 + y²), 1 - (1 / (1 + x² + y²)), 1 / (1 + x²))")
  disp(" (3) Função de classe C¹, mas não de classe C²")
  opcao = input(" Sua escolha: ");
  if (opcao == 1)
    endereco = f_enunciado(p);
  elseif (opcao == 2)
    endereco = funcao2(p);
  else
    endereco = funcao3(p);
  endif
else
  endereco = input("Qual o endereço da imagem? ", "s");
endif

k = input("Qual o valor de k? ");
end_comp = compress(endereco, k);
method = input("Qual método de interpolação?\n (1) Bilinear\n (2) Bicúbico\n Sua escolha: ");

h = input("Qual o valor de h? ");
end_decomp = decompress(end_comp, method, k, h);
calculateError(endereco, end_decomp);