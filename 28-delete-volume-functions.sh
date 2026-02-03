#Delete Volumes Less than 5GB In size
#!/bin/bash
delete_volumes(){
    vols=$(aws ec2 describe-volumes | jq ".Volumes[].VolumeId" | tr -d '"')
    for vol in $vols
    do 
        size=$(aws ec2 describe-volumes --volume-ids $vol | jq ".Volumes[].Size")
        if [ $size -gt 5 ]
        then
            echo "$vol is a prod volume. DOnt delete"
        else  
            echo "Deleting voume $vol"
            aws ec2 delete-volume --volume-id $vol
        fi
    done
}

delete_volumes