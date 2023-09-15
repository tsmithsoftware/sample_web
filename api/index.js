module.exports.handler = async (event) => {
  return {
    statusCode: 200,
    body: JSON.stringify(
      {
        schedules: [
          {
            events: [
              {
                utcDateTimeStart: "2023-09-15T14:44:57.807Z",
                utcDateTimeEnd: "2023-09-15T15:44:57.807Z",
                description: "A Schedule",
                trainer: "Bob Shildorf"
              }
            ]
          }
        ]
      },
      null,
      2
    ),
  };
};
