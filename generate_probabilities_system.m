function [A, b] = generate_probabilities_system(rows)
  numbers = rows * (rows + 1) / 2;
  A = zeros(numbers);
  b = zeros(numbers,1);
  %for the first 2 rows
  A(1,1) = 4;
  A(1,2:3) = -1;
  A(2,1:5) = -1;
  A(2,2) = 5;
  A(3,1:6) = -1;
  A(3,3) = 5;
  A(3,4) = 0;
  
  %writing for the last row:
  first_index_of_penultimate_row = (rows - 2) * (rows - 1) / 2 + 1;
  first_index_of_ultimate_row = (rows - 1) * rows / 2 + 1;
  last_index_of_penultimate_row = (rows - 1) * rows / 2;
  last_index_of_ultimate_row = numbers;
  %left low corner
  A(first_index_of_ultimate_row, first_index_of_ultimate_row) = 4;
  A(first_index_of_ultimate_row, first_index_of_ultimate_row + 1) = -1;
  A(first_index_of_ultimate_row, first_index_of_penultimate_row) = -1;
  %right low corner
  A(last_index_of_ultimate_row, last_index_of_ultimate_row) = 4;
  A(last_index_of_ultimate_row, last_index_of_ultimate_row - 1) = -1;
  A(last_index_of_ultimate_row, last_index_of_penultimate_row) = -1;
  %writing the 1's on b vector
  b(first_index_of_ultimate_row, 1) = 1;
  b(last_index_of_ultimate_row, 1) = 1;
  %last row middle:
  for i = first_index_of_ultimate_row + 1 : last_index_of_ultimate_row - 1
    A(i, i) = 5;
    A(i, i - 1) = -1;
    A(i, i + 1) = -1;
    A(i, first_index_of_penultimate_row + i - first_index_of_ultimate_row - 1) = -1;
    A(i, first_index_of_penultimate_row + i - first_index_of_ultimate_row) = -1;
    b(i,1) = 1;
  end
  %for rows betweend 3rd and rows-1:
  for i = 3 : rows - 1
    first_index_of_previous_row = (i - 2) * (i - 1) / 2 + 1;
    last_index_of_previous_row = (i - 1) * i / 2;
    first_index_of_current_row = last_index_of_previous_row + 1;
    last_index_of_current_row = i * (i + 1) / 2;
    first_index_of_next_row = last_index_of_current_row + 1;
    last_index_of_next_row = (i + 1) * (i + 2) / 2;
    %for left corner of current line
    A(first_index_of_current_row, first_index_of_current_row) = 5;
    A(first_index_of_current_row, first_index_of_current_row + 1) = -1;
    A(first_index_of_current_row, first_index_of_previous_row) = -1;
    A(first_index_of_current_row, first_index_of_next_row) = -1;
    A(first_index_of_current_row, first_index_of_next_row + 1) = -1;
    %for right corner of current line
    A(last_index_of_current_row, last_index_of_current_row) = 5;
    A(last_index_of_current_row, last_index_of_current_row - 1) = -1;
    A(last_index_of_current_row, last_index_of_previous_row) = -1;
    A(last_index_of_current_row, last_index_of_next_row) = -1;
    A(last_index_of_current_row, last_index_of_next_row - 1) = -1;
    for j = first_index_of_current_row + 1 : last_index_of_current_row -1
      A(j, j) = 6;
      A(j, j + 1) = -1;
      A(j, j - 1) = -1;
      A(j, first_index_of_previous_row + j - first_index_of_current_row - 1) = -1;
      A(j, first_index_of_previous_row + j - first_index_of_current_row) = -1;
      A(j, first_index_of_next_row + j -first_index_of_current_row) = -1;
      A(j, first_index_of_next_row + j -first_index_of_current_row + 1) = -1;
    end
  end
endfunction
