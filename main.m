modo = input("Deseja executar o programa com...\n (1) Função\n (2) Imagem pronta\nSua resposta: ");
if (modo == 1)
  p = input("Quantos pixels? ");
  opcao = input("Qual função deseja usar?\n (1) f(x,y) = (sen(x), (sen(y) + sen(x)) / 2, sen(x))\n (2) f(x,y) = (1 / (1 + y²), 1 - (1 / (1 + x² + y²)), 1 / (1 + x²))\nSua escolha: ");
  if (opcao == 1)
    endereco = f_enunciado(p);
  else
    endereco = funcao2(p);
  endif
else
  endereco = input("Qual o endereço da imagem? ", "s");
endif

k = input("Qual o valor de k? ");
end_comp = compress(endereco, k);
method = input("Qual método de interpolação?\n (1) Bilinear\n (2) Bicúbico\nSua escolha: ");
h = input("Qual o valor de h? ");
end_decomp = decompress(end_comp, method, k, h);
calculateError(endereco, end_decomp);