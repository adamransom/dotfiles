if @% ==? "'__doc__'"
  let max_height = ((&lines - &cmdheight - 2) / 3)
  let min_height = 5
  let desired_height = line('$') + 1
  let height = min([max_height, desired_height])
  let height = max([min_height, height])
  exec "resize " . height
endif
