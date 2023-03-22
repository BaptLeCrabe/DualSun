<template>
<v-container class="fill-height">
    <v-responsive class="d-flex align-center text-center fill-height">
        <v-img contain height="50" src="@/assets/logo.png" />
        <div>
            <h2>procès verbal de mise en service (PVMES)</h2>
            <v-sheet max-width="500" class="mx-auto mt-5">
                <v-form v-model="isFormValid" @submit.prevent>
                    <v-card variant="outlined" class="pa-5">
                        <h6 class="text-left">Détails de la société</h6>
                        <v-text-field density="compact" variant="underlined" class="mt-0" lazy-validation required v-model="record.companyName" label="Nom" :rules="[rules.isRequired]"></v-text-field>
                        <v-text-field density="compact" variant="underlined" class="mt-0" lazy-validation required v-model="record.companySiren" label="SIREN" :rules="[rules.numbersOnly, rules.lengthDigitsSiren]"></v-text-field>
                    </v-card>
                    <v-card variant="outlined" class="pa-5 mt-5">
                        <h6 class="text-left">Détails du client</h6>
                        <v-text-field density="compact" variant="underlined" class="mt-0" lazy-validation required v-model="record.customerName" label="Nom" :rules="[rules.isRequired]"></v-text-field>
                        <v-text-field density="compact" variant="underlined" class="mt-0" lazy-validation required v-model="record.customerMail" label="Email" :rules="[rules.mail]"></v-text-field>
                        <MazPhoneNumberInput label="Numero de téléphone" :noCountrySelector="true" v-model="record.customerPhone" show-code-on-list color="info" :preferred-countries="['FR']" @update="validPhone = $event?.isValid" :success="results?.isValid" />
                    </v-card>
                    <v-card variant="outlined" class="pa-5 mt-5">
                        <h6 class="text-left">Détails de l'installation</h6>
                        <v-text-field density="compact" variant="underlined" class="mt-0" lazy-validation required v-model="record.worksiteAddress" label="Adresse" :rules="[rules.isRequired]"></v-text-field>
                        <v-text-field density="compact" variant="underlined" class="mt-0" lazy-validation required v-model="record.worksiteDate" label="Date" type="date" :rules="[rules.isRequired]"></v-text-field>
                        <v-text-field density="compact" variant="underlined" class="mt-0" lazy-validation required v-model="record.worksitePanels" label="Nombre de panneaux" :rules="[rules.numbersOnly, rules.isRequired]"></v-text-field>
                        <v-radio-group v-model="record.worksitePanelType" label="Type de panneau" inline :rules="[rules.isRequired]">
                            <v-radio label="Photovoltaïque" value="1"></v-radio>
                            <v-radio label="Hybride" value="2"></v-radio>
                        </v-radio-group>
                        <v-text-field density="compact" variant="underlined" class="mt-0" lazy-validation required :rules="[rules.numbersOnly, rules.lengthDigitsCode]" :counter="6" v-model="record.worksitePanelDigit" label="Code produit"></v-text-field>
                    </v-card>
                    <v-btn :disabled="!isFormValid || !validPhone" type="submit" block class="mt-2" @click="sendForm()">Envoyer</v-btn>
                </v-form>
            </v-sheet>
        </div>
    </v-responsive>
</v-container>
</template>

<script lang="ts">
import MazPhoneNumberInput from 'maz-ui/components/MazPhoneNumberInput'
import axios from 'axios'
import {
    Record
} from '@/interfaces/record'

export default {
    name: 'SinglePage',
    data() {
        return {
            isFormValid: false as boolean,
            validPhone: false as boolean,
            results: {
                isValid: false as boolean,
            } as object,
            record: {
                companyName: '',
                companySiren: '',
                customerName: '',
                customerMail: '',
                customerPhone: '',
                worksiteAddress: '',
                worksiteDate: '',
                worksitePanels: '',
                worksitePanelType: '',
                worksitePanelDigit: '',
            } as Record,
            rules: {
                mail: (v: string) =>
                    !v || /^\w+([.-]?\w+)*@\w+([.-]?\w+)*(\.\w{2,3})+$/.test(v) || 'E-mail doit être valide',
                lengthDigitsCode: (v: string) =>
                    !v || v.length === 6 || 'Le code produit doit être composé de 6 chiffres',
                lengthDigitsSiren: (v: string) =>
                    !v || v.length === 9 || 'Le SIREN doit être composé de 9 chiffres',
                numbersOnly: (v: string) =>
                    !v || this.isNumber(v) || 'Le code produit doit être uniquement composé de chiffres',
                isRequired: (v: string) => {
                    return (v ? true : 'Ce champ doit être rempli')
                },
            },
        }
    },
    components: {
        MazPhoneNumberInput
    },
    methods: {
        sendForm() {
            axios
                .post("http://localhost:3000/records", this.generateAxiosParams())
                .then((response) => {
                    console.log(response);
                    alert("Formulaire envoyé !");
                    this.record = {} as Record;
                    this.isFormValid = false;
                })
                .catch((error) => {
                    console.log(error);
                    alert("Erreur lors de l'envoi du formulaire");
                });
        },

        generateAxiosParams(): object {
            return {
                company_name: this.record.companyName,
                company_siren: this.record.companySiren,
                customer_name: this.record.customerName,
                customer_phone: this.record.customerPhone,
                customer_mail: this.record.customerMail,
                worksite_address: this.record.worksiteAddress,
                worksite_date: this.record.worksiteDate,
                worksite_panels: this.record.worksitePanels,
                worksite_panel_type_id: this.record.worksitePanelType,
                worksite_panel_digit: this.record.worksitePanelDigit
            }
        },
        isNumber(val: string): boolean {
            if (typeof val === "string") {
                return !isNaN(Number(val));
            }
            return false;
        },
        isNotEmpty(str: string) {
            return !(!str || str.length === 0);
        }
    }
}
</script>
