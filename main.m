endereco = input("Qual o endereço da imagem? ", "s");
k = input("Qual o valor de k? ");
end_comp = compress(endereco, k);
method = input("Qual método de interpolação?\n (1) Bilinear\n (2) Bicúbico\nSua escolha: ");
h = input("Qual o valor de h? ");
end_decomp = decompress(end_comp, method, k, h);
calculateError(endereco, end_decomp);