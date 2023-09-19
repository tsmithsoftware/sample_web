//https://github.com/sequelize/express-example/blob/master/express-main-example/sequelize/index.js

function applyExtraSetup(sequelize) {
	const { events, schedules, users} = sequelize.models;

	users.hasMany(schedules, {
		foreignKey: "scheduleid"
	});
	schedules.belongsTo(users, {
		foreignKey: "userid"
	});
    schedules.hasMany(events, {
		foreignKey: "scheduleid"
	});
}

module.exports = { applyExtraSetup };