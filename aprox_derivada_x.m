function derivada = aprox_derivada_x (matriz, i, j, h)
  % função que retorna a derivada parcial aproximada em relação a x no ponto (x_i, y_j)
  if (i == 1)
    derivada = (matriz(i + 1, j) - matriz(i, j)) / 2*h;
  elseif (i == columns(matriz))
    derivada = (matriz(i, j) - matriz(i - 1, j)) / 2*h;
  else
    derivada = (matriz(i + 1, j) - matriz(i - 1, j)) / 2*h;
  endif 
endfunction