const db = require('../services/db');

async function getUsers(code) {
    let query = 'SELECT us.id, us.name FROM users as us LEFT JOIN user_invitation as ui ON us.id = ui.user_id where ui.invite_code = "' + code + '"';
    const data = await db.query(query);
    return {
        data
    }
}

async function getUsersWithFrnds() {
    let user_query = 'SELECT us.id, us.name FROM users as us where us.is_deleted = 0';
    let user_data = await db.query(user_query);
    let user_data_obj = {};
    let user_id_array_list = [];
    user_data.forEach(async (val, key) => {
        user_data_obj[val.id] = val;
        user_id_array_list.push(val.id);
    });
    let frnds_data = await getUserFriends(user_id_array_list);
    user_id_array_list.forEach((val,key)=>{
        let friendData = frnds_data[val] ? frnds_data[val] : [];
        user_data_obj[val]['freind'] =  friendData
    })
    return {
        data:user_data_obj
    }
}

async function getUserFriends(ids) {
    let user_ids = ids.join(",");
    let query = 'SELECT ui.user_id, us.name FROM users as us LEFT JOIN user_invitation as ui ON us.id = ui.registered_user_id where ui.user_id in (' + user_ids + ') and ui.registered_user_id != 0';
    let userData = await db.query(query);
    let friendsList = {};
    userData.forEach((val, key) => {
        if (friendsList[val.user_id]) {
            friendsList[val.user_id].push(val.name);
        } else {
            friendsList[val.user_id] = [];
            friendsList[val.user_id].push(val.name);
        }
    })
    return friendsList;
}

module.exports = {
    getUsers: getUsers,
    getUsersWithFrnds: getUsersWithFrnds
}