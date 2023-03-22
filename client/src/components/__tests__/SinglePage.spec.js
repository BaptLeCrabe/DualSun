import { shallowMount } from '@vue/test-utils'
import SinglePage from '../SinglePage.vue'

jest.mock('maz-ui/components/MazPhoneNumberInput', () => ({
    name: 'MazPhoneNumberInput',
    render: function (createElement) {
      return createElement('input', { attrs: { type: 'tel' } });
    },
  }));

describe('SinglePage', () => {
  it('requires all required fields', async () => {
    const wrapper = shallowMount(SinglePage)
    const submitButton = wrapper.find('button[type="submit"]')

    await submitButton.trigger('click')

    expect(wrapper.vm.$data.isFormValid).toBeFalsy()
    expect(wrapper.find('.v-messages__message').text()).toContain('Champ obligatoire')
  })

  it('requires a valid email address', async () => {
    const wrapper = shallowMount(SinglePage)
    const emailInput = wrapper.find('input[type="email"]')
    emailInput.setValue('invalid-email-address')
    const submitButton = wrapper.find('button[type="submit"]')
  
    await submitButton.trigger('click')
  
    expect(wrapper.vm.$data.isFormValid).toBeFalsy()
    expect(wrapper.find('.v-messages__message').text()).toContain('E-mail doit être valide')
  })

  it('requires a valid phone number', async () => {
    const wrapper = shallowMount(SinglePage)
    const phoneInput = wrapper.findComponent({ name: 'MazPhoneNumberInput' })
    phoneInput.vm.$emit('update', { isValid: false })
    const submitButton = wrapper.find('button[type="submit"]')
  
    await submitButton.trigger('click')
  
    expect(wrapper.vm.$data.isFormValid).toBeFalsy()
    expect(wrapper.find('.v-messages__message').text()).toContain('Numéro de téléphone invalide')
  })
  
})
