function derivada = aprox_derivada_y (matriz, i, j, h)
  % função que retorna a derivada parcial aproximada em relação a y no ponto (x_i, y_j)
  if (j == 1)
    derivada = (matriz(i, j + 1) - matriz(i, j)) / (2*h);
  elseif (j == rows(matriz))
    derivada = (matriz(i, j) - matriz(i, j - 1)) / (2*h);
  else
    derivada = (matriz(i, j + 1) - matriz(i, j - 1)) / (2*h);
  endif
endfunction