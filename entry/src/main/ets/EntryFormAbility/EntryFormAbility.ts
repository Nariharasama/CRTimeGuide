import FormExtensionAbility from '@ohos.app.form.FormExtensionAbility';
import formBindingData from '@ohos.app.form.formBindingData';
import formProvider from '@ohos.app.form.formProvider';
import formInfo from '@ohos.app.form.formInfo';




export default class EntryFormAbility extends FormExtensionAbility {
  onAddForm(want) {
    let formId = want.parameters["ohos.extra.param.key.form_identity"];
    console.info('formID'+formId);
    // 使用方创建卡片时触发，提供方需要返回卡片数据绑定类
    let obj={};
    let formData = formBindingData.createFormBindingData(obj);
    return formData;
  }
  onCastToNormalForm(formId) {
    // 使用方将临时卡片转换为常态卡片触发，提供方需要做相应的处理
    console.info('[EntryFormAbility] onCastToNormalForm');
  }
  onUpdateForm(formId) {
    // 若卡片支持定时更新/定点更新/卡片使用方主动请求更新功能，则提供方需要重写该方法以支持数据更新
    console.info('[EntryFormAbility] onUpdateForm');
    let obj = {
      "StartStation": globalThis.startstation,
      "EndStation":globalThis.endstation
    };
    let formData = formBindingData.createFormBindingData(obj);
    formProvider.updateForm(formId, formData).catch((error) => {
      console.info('[EntryFormAbility] updateForm, error:' + JSON.stringify(error));
    });
  }
  onChangeFormVisibility(newStatus) {
    // 使用方发起可见或者不可见通知触发，提供方需要做相应的处理，仅系统应用生效
    console.info('[EntryFormAbility] onChangeFormVisibility');
  }
  onFormEvent(formId, message) {

  }
  onRemoveForm(formId) {
    // 删除卡片实例数据
    console.info('[EntryFormAbility] onRemoveForm');
  }
  onConfigurationUpdate(config) {
    console.info('[EntryFormAbility] nConfigurationUpdate, config:' + JSON.stringify(config));
  }
  onAcquireFormState(want) {
    return formInfo.FormState.READY;
  }
}