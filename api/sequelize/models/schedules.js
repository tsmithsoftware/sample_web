//https://github.com/sequelize/express-example/blob/master/express-main-example/sequelize/index.js

const { DataTypes } = require('sequelize');

// We export a function that defines the model.
// This function will automatically receive as parameter the Sequelize connection object.
module.exports = (sequelize) => {
	sequelize.define('schedules', {
		// The following specification of the 'id' attribute could be omitted
		// since it is the default.
		id: {
			allowNull: false,
			autoIncrement: true,
			primaryKey: true,
			type: DataTypes.INTEGER
		},
		scheduleName: {
			allowNull: false,
			type: DataTypes.STRING,
			field: 'schedulename'
		}
		// We also want it to have a 'userid' field, but we don't have to define it here.
		// It will be defined automatically when Sequelize applies the associations.
	});
};