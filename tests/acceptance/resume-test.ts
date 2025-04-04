import { module, test } from 'qunit';
import { visit } from '@ember/test-helpers';
import { a11yAudit } from 'ember-a11y-testing/test-support';
import { setupApplicationTest } from 'ember-qunit';

module('Acceptance | resume', function (hooks) {
  setupApplicationTest(hooks);

  test('Resume page passes automated a11y tests', async function (assert) {
    await visit('/resume');
    await a11yAudit();
    assert.ok(true, 'no a11y errors found!');
  });
});
