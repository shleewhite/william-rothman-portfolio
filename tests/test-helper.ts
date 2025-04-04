import Application from 'william-rothman-portfolio/app';
import config from 'william-rothman-portfolio/config/environment';
import * as QUnit from 'qunit';
import { setApplication } from '@ember/test-helpers';
import { setup } from 'qunit-dom';
import { start } from 'ember-qunit';
import { setupGlobalA11yHooks } from 'ember-a11y-testing/test-support';

setApplication(Application.create(config.APP));
setupGlobalA11yHooks(() => true);

setup(QUnit.assert);

start();
