/**
 * Import Sequelize.
 */
const Sequelize = require("sequelize");
const { applyExtraSetup } = require("./assoc")

/**
 * Create a Sequelize instance. This can be done by passing
 * the connection parameters separately to the Sequelize constructor.
 */
const sequelize = new Sequelize("postgres", "username", "password", {
    host: "127.0.0.1",
    dialect: "postgresql",
    port: 5432,
    pool: {
        max: 2,
        min: 0,
        idle: 0,
        acquire: 3000,
        evict: 30,
        dialect: "postgres"
      },
    define: {
      freezeTableName: true,
      timestamps: false
    }
});

const modelDefiners = [
	require('./models/users'),
	require('./models/events'),
	require('./models/schedules'),
];

// We define all models according to their files.
for (const modelDefiner of modelDefiners) {
	modelDefiner(sequelize);
}

// We execute any extra setup after the models are defined, such as adding associations.
applyExtraSetup(sequelize);

/**
 * Export the Sequelize instance. This instance can now be 
 * used in the app.js file to authenticate and establish a database connection.
 */
module.exports = sequelize;
