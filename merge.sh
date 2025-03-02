for branch in $(git branch -r | grep -v '\->' | grep -v 'origin/development'); do
    # Get the branch name without 'origin/'
    branch_name=${branch#origin/}
    
    # Checkout the branch
    git checkout $branch_name
    
    # Merge the development branch
    git merge development
    
    # Push the changes back to the remote repository
    git push origin $branch_name
done
