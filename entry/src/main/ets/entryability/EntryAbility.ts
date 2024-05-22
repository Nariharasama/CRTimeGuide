import UIAbility from '@ohos.app.ability.UIAbility';
import hilog from '@ohos.hilog';
import window from '@ohos.window';
import formBindingData from '@ohos.app.form.formBindingData';
import formProvider from '@ohos.app.form.formProvider';
import formInfo from '@ohos.app.form.formInfo';
import systemDateTime from '@ohos.systemDateTime';

export default class EntryAbility extends UIAbility {
  ToSec(timeStr:string){
    const timeRegex = /^(\d{2}):(\d{2})$/;
    const matches = timeRegex.exec(timeStr);
    if (matches === null) {
      return null;
    }
    let hours = parseInt(matches[1], 10);
    let minutes = parseInt(matches[2], 10);
    let full=0;
    full=hours*3600+minutes+60
    return full
  }


  onCreate(want, launchParam) {
    globalThis.entryAbilityWant = want;
    globalThis.startstation="";
    globalThis.endstation="";
    globalThis.formId="0";
    globalThis.formIdall=[];
    globalThis.startIds=[];
    globalThis.endIds=[];
    globalThis.stations=[];
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

    }
  }
}
