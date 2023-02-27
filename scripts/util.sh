# Constructs a path from the provided arguments
function construct_path () {
    local full_path=''

    for path in "$@"
    do
        if [ "$full_path" != "" ]
        then
            full_path="${full_path}/${path}" 
        else
            full_path=$path
        fi
    done

    echo $full_path
}
