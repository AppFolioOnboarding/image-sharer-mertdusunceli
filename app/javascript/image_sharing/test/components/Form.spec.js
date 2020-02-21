/* eslint-env mocha */

import assert from 'assert';
import { mount } from 'enzyme';
import React from 'react';
import Form from '../../components/Form';

describe('<Form />', () => {
  it('should render correctly', () => {
    const wrapper = mount(<Form />);
    const form = wrapper.find('form');
    const inputs = form.find('input');
    const inputName = inputs.find('.form-control');
    const submitButton = inputs.find('.btn');
    const inputComment = wrapper.find('textarea');

    assert.strictEqual(inputName.length, 1);
    assert.strictEqual(submitButton.length, 1);
    assert.strictEqual(inputComment.length, 1);
  });
});
