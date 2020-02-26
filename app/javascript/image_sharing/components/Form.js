import React from 'react';
import { post } from '../utils/helper.js';
import FlashMessage from './FlashMessage.js';

export default class Form extends React.Component {
  constructor(props) {
    super(props);
    this.state = { name: '', comment: '', result: '', msg: '' };
    this.handleChangeName = this.handleChangeName.bind(this);
    this.handleChangeComment = this.handleChangeComment.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleChangeName(event) {
    this.setState({ name: event.target.value });
  }

  handleChangeComment(event) {
    this.setState({ comment: event.target.value });
  }

  handleSubmit(event) {
    post('/api/feedbacks', {
      name: this.state.name,
      comment: this.state.comment
    }).then((result) => {
      this.setState({ result: true, msg: result.msg });
    }).catch((e) => {
      this.setState({ result: false, msg: e.data.msg });
    });
    this.setState({ name: '', comment: '' });
    event.preventDefault();
  }

  render() {
    return (
      <div>
        <div style={{
          display: 'flex',
          justifyContent: 'center',
          alignItems: 'center',
          height: '100%',
          margin: '10px'
        }}
        >
          {this.state.msg === '' ? (
            null
          ) : (
            <FlashMessage isSuccess={this.state.result} msg={this.state.msg} />
          )}
        </div>
        <div style={{
          display: 'flex',
          justifyContent: 'center',
          alignItems: 'center',
          height: '100%',
          margin: '30px' }}
        >
          <form onSubmit={this.handleSubmit}>
            <div style={{ padding: '10px' }}>
              <label htmlFor='name'> Your name:
                <input
                  type="text"
                  id='name'
                  value={this.state.name}
                  onChange={this.handleChangeName}
                  className="form-control"
                />
              </label>
            </div>
            <div style={{ padding: '10px' }}>
              <label htmlFor='comment'> Comments:
                <textarea
                  type="text"
                  id='comment'
                  value={this.state.comment}
                  onChange={this.handleChangeComment}
                  className="form-control"
                />
              </label>
            </div>
            <div style={{ padding: '10px' }}>
              <input type="submit" value="Submit" className="btn btn-primary" />
            </div>
          </form>
        </div>
      </div>
    );
  }
}
