const express = require('express');
const logger = require('morgan');

const indexRouter = require('./routes/index');
const userRouter = require('./routes/users');

const app = express();

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));

app.use('/', indexRouter);
app.use('/api', userRouter);

module.exports = app;