function derivada = aprox_derivada_dupla (matriz, i, j, h)
  % função que retorna a derivada parcial dupla aproximada em relação a x e y no ponto (x_i, y_j)
  if (i == 1)
    derivada = (aprox_derivada_y(matriz, i + 1, j, h) - aprox_derivada_y(matriz, i, j, h)) / 2*h;
  elseif (i == columns(matriz))
    derivada = (aprox_derivada_y(matriz, i, j, h) - aprox_derivada_y(matriz, i - 1, j, h)) / 2*h;
  else
    derivada = (aprox_derivada_y(matriz, i + 1, j, h) - aprox_derivada_y(matriz, i - 1, j, h)) / 2*h;
  endif
endfunction