import UIAbility from '@ohos.app.ability.UIAbility';
import hilog from '@ohos.hilog';
import window from '@ohos.window';
import formBindingData from '@ohos.app.form.formBindingData';
import formProvider from '@ohos.app.form.formProvider';
import formInfo from '@ohos.app.form.formInfo';

export default class EntryAbility extends UIAbility {
  onCreate(want, launchParam) {
    globalThis.entryAbilityWant = want;
    globalThis.startstation="";
    globalThis.endstation="";
    globalThis.formId="0";
  }

  onDestroy() {
  }



  onWindowStageCreate(windowStage: window.WindowStage) {

    windowStage.loadContent('pages/Index', (err, data) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
    });
  }

  onWindowStageDestroy() {

  }

  onForeground() {

  }

  onBackground() {

  }


  onNewWant(want, launchParam) {
    console.info('onNewWant Want:' + JSON.stringify(want));
    if (want.parameters[formInfo.FormParam.IDENTITY_KEY] !== undefined) {
      let curFormId = want.parameters[formInfo.FormParam.IDENTITY_KEY];
      globalThis.formId=curFormId;
      let message = JSON.parse(want.parameters.params).detail;
      console.info(`UpdateForm formId: ${curFormId}, message: ${message}`);
      let formData = {
        "StartStation":globalThis.startstation,
        "EndStation":globalThis.endstation,// 和卡片布局中对应
      };
      let formMsg = formBindingData.createFormBindingData(formData)
      formProvider.updateForm(curFormId, formMsg).then((data) => {
        console.info('updateForm success.' + JSON.stringify(data));
      }).catch((error) => {
        console.error('updateForm failed:' + JSON.stringify(error));
      })
    }
  }
}
