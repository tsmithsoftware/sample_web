//https://github.com/sequelize/express-example/blob/master/express-main-example/sequelize/index.js

const { DataTypes } = require('sequelize');

// We export a function that defines the model.
// This function will automatically receive as parameter the Sequelize connection object.
module.exports = (sequelize) => {
	sequelize.define('events', {
		// The following specification of the 'id' attribute could be omitted
		// since it is the default.
		id: {
			allowNull: false,
			autoIncrement: true,
			primaryKey: true,
			type: DataTypes.INTEGER
		},
		eventName: {
			allowNull: false,
			type: DataTypes.STRING,
			field: 'eventname'
		},
		startTime: {
			allowNull: false,
			type: DataTypes.DATE,
			field: 'starttime'
		},
		endTime: {
			allowNull: false,
			type: DataTypes.DATE,
			field: 'endtime'
		}
		// We also want it to have a 'scheduleId' field, but we don't have to define it here.
		// It will be defined automatically when Sequelize applies the associations.
	});
};