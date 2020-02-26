import React from 'react';
import PropTypes from 'prop-types';

export default function FlashMessage(props) {
  return props.isSuccess ? (
    <div className="alert alert-success" role="alert">
      {props.msg}
    </div>
  ) : (
    <div className="alert alert-danger" role="alert">
      {props.msg}
    </div>
  );
}

FlashMessage.propTypes = {
  isSuccess: PropTypes.bool,
  msg: PropTypes.string
};
