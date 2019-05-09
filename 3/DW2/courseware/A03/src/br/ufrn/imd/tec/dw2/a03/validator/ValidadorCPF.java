package br.ufrn.imd.tec.dw2.a03.validator;

import javax.faces.application.FacesMessage;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.validator.FacesValidator;
import javax.faces.validator.Validator;
import javax.faces.validator.ValidatorException;

@FacesValidator("validadorCPF")
public class ValidadorCPF implements Validator {
	@Override
    public void validate(FacesContext context, UIComponent component, Object value) throws ValidatorException {
        boolean valido = false;
        String cpf = value.toString();
        // validando o formato do CPF.
        try {
            Long.parseLong(cpf.replaceAll("[\\D]+", ""));
        } catch (Exception e) {
            FacesMessage msg = new FacesMessage("CPF inválido: CPF não pode conter letras.");
            msg.setSeverity(FacesMessage.SEVERITY_ERROR);
            throw new ValidatorException(msg);
        }
        // validando a existência do CPF - não entendi.
        int soma = 0;
        if (cpf.length() == 11) {
            for (int i = 0; i < 9; i++) {
                soma += (10 - i) * (cpf.charAt(i) - '0');
            }
            soma = 11 - (soma % 11);
            if (soma > 9)
                soma = 0;
            if (soma == (cpf.charAt(9) - '0')) {
                soma = 0;
                for (int i = 0; i < 10; i++) {
                    soma += (11 - i) * (cpf.charAt(i) - '0');
                }
                soma = 11 - (soma % 11);
                if (soma > 9)
                    soma = 0;
                if (soma == (cpf.charAt(10) - '0')) {
                    valido = true;
                }
            }
        }
        if (!valido) {
            FacesMessage msg = new FacesMessage(" CPF inválido: Esse CPF não existe.");
            msg.setSeverity(FacesMessage.SEVERITY_ERROR);
            throw new ValidatorException(msg);
        }
    }
}