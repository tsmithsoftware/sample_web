const sequelize = require("./sequelize");
const { models } = require("./sequelize")

async function loadSequelize() {

  // or `sequelize.sync()`
  await sequelize.authenticate();
//  await sequelize.sync();

  return sequelize;
}

module.exports.handler = async function (event, callback) {
  // re-use the sequelize instance across invocations to improve performance
  if (!sequelize) {
    sequelize = await loadSequelize();
  } else {
    // restart connection pool to ensure connections are not re-used across invocations
    sequelize.connectionManager.initPools();

    // restore `getConnection()` if it has been overwritten by `close()`
    if (sequelize.connectionManager.hasOwnProperty("getConnection")) {
      delete sequelize.connectionManager.getConnection;
    }
  }

  try {
    //sequelize.sync().then(() => { return getUsers(db) });
    return await getUsers(sequelize);
  } finally {
    // close any opened connections during the invocation
    // this will wait for any in-progress queries to finish before closing the connections
    await sequelize.connectionManager.close();
  }
};

async function getUsers() {
  return await models.users.findAll({
    attributes: ["id", "firstname", "lastname"]
  },
  )
  .then((result) => {
    return {
      "users": JSON.stringify(result)
    }
  })
  .catch((error) => {
      console.log(error);
      return {"results": "cannot get records!"}
  });
}