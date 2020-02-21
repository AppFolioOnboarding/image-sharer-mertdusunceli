/* eslint-env mocha */

import assert from 'assert';
import { mount } from 'enzyme';
import React from 'react';
import Footer from '../../components/Footer';

describe('<Footer />', () => {
  it('should render correctly', () => {
    const wrapper = mount(<Footer />);

    assert(wrapper.contains('Copyright: AppFolio Inc. Onboarding'));
  });
});
