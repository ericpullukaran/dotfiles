git_branch_name_and_status() {
  local branch_name
  branch_name=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)
  # Check if the working directory is clean
  local dstatus=$(git status --porcelain)
  if [[ -n "$branch_name" ]]; then
    if [[ -z "$dstatus" ]]; then
      # Working directory is clean
      echo " ┊ %{$fg[magenta]%}⎇  $branch_name %{$fg[green]%}✔︎%f"
    else
      # Working directory has changes (dirty)
      echo " ┊ %{$fg[magenta]%}⎇  $branch_name%f %{$fg[red]%}•%f"
    fi
  fi
}

performant_git_branch_name() {
  local branch_name
  local in_git_repo=$(git rev-parse --is-inside-work-tree 2> /dev/null)

  if [[ $in_git_repo == "true" ]]; then
    branch_name=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)
    if [[ -n "$branch_name" ]]; then
      # Just display the branch name
      echo " ┊ %{$fg[magenta]%}⎇  $branch_name%f"
    fi
  fi
}

dynamic_git_branch_name() {
  local in_git_repo=$(git rev-parse --is-inside-work-tree 2> /dev/null)
  if [[ $in_git_repo == "true" ]]; then
      # Check if repo in the large list
      local repo_root=$(git rev-parse --show-toplevel 2> /dev/null)
      local large_repos=("/Users/ericp/work/canva")  # add more here if needed
      if [[ " ${large_repos[@]} " =~ " ${repo_root} " ]]; then
        performant_git_branch_name
      else
        # Check if the repo is large
        local repo_size_threshold=10000
        local file_count=$(git ls-files | wc -l)
        if [[ $file_count -lt $repo_size_threshold ]]; then
          git_branch_name_and_status
        else
          performant_git_branch_name
        fi
      fi
  fi
}


PROMPT='%{$fg[green]%}eroc%f %{$fg[blue]%}%~%f $(dynamic_git_branch_name)
%(?.%{$fg[green]%}➜ %f.%{$fg[red]%}• %f)'

