/*!
 * Copyright(c) 2014 jason.bin <23692515@qq.com>
 * 关于用户数据redis 操作
 * 数据库交互的数据在本文件完成，数据库中数据格式不要传到外层
 * 数据库需要序列列在此处处理
 * 逻辑层交互最小单位是obj
 */
var redisCmd = require("./redis/redisCmd");
var CONST = require('../common/consts');
var DBKEY = "fish4mail:";

//本文件导出
var MailDao = module.exports;
/**
 * 已经存在用户写档,key values 对应
 * h_user 写档
 */
MailDao.write = function (user, cb){
    //初始化设置玩家信息保存到数据库
    var mng = user.contMng;
    var guid = user.getUid();
    var writeData = mng.mails.writeDataToDbByUid();
    //console.log("-------------------101writeData2",writeData);
    redisCmd.hmset(
        DBKEY + guid,
        writeData,
        function (err, reply) {
            cb(err, reply);
        });
};

MailDao.writeByParam = function (guid, mailInfo, cb){
    if(guid == undefined || mailInfo == undefined){
        cb(1, null);
        return;
    }

    redisCmd.hset(
        DBKEY + guid,
        mailInfo.id,
        JSON.stringify(mailInfo),
        function (err, reply) {
            cb(err, reply);
        }
    );
};
/**
 *读档, 读档成功后生item对象
 */
MailDao.load = function (user, cb){
    var uid    = user.getUid();
    var cmd     = DBKEY + uid;
    redisCmd.hgetall(cmd, function (err, reply) {
        if (err) {
            cb(err, null);
            return;
        }
        if (!reply) {
            //这种情况是数据中没有该user,可能是个新用户
            cb(err,  null);
            return;
        }
        //console.log("----------104-------------------------------reply",reply);
        user.contMng.mails.fromDb(reply);
        cb(null, {});
    });
}


/**
 *删除指定OBJ
 */
MailDao.delete = function (user, mailguid, cb){
    if(user == undefined || mailguid == undefined){
        cb(1, null);
        return;
    }
    var cmd  = DBKEY + user.getUid();
    redisCmd.hdel(cmd, mailguid, function (err, reply) {
        cb(err, reply);
    });
}

MailDao.deleteAllByGuid = function (guid, keys, cb) {
    if(guid == undefined || keys == undefined){
        cb(1, null);
        return;
    }

    var cmd = DBKEY + guid;
    if(keys != null && keys.length > 0){
        redisCmd.hdel(cmd,
            keys,
            function (err, reply) {
                cb(err, reply);
            }
        );
    }
    else {
        redisCmd.del(cmd,
            function (err, reply) {
                cb(err, reply);
            }
        );
    }
}