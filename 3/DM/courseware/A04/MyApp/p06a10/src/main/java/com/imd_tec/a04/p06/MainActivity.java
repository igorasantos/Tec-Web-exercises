package com.imd_tec.a04.p06;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;

import java.util.Calendar;

public class MainActivity extends AppCompatActivity {
    private int mesAtual = Calendar.getInstance().get(Calendar.MONTH);
    //private Calendar cal = Calendar.getInstance();
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        if (savedInstanceState != null) {
            mesAtual = savedInstanceState.getInt("mesAtual");
        }
        //cal.mostrarMes(mesAtual); // função não implementada
    }
    @Override
    protected void onSaveInstanceState(Bundle outState) {
        super.onSaveInstanceState(outState);
        outState.putInt("mesAtual", mesAtual);
    }
    @Override
    protected void onDestroy() {
        super.onDestroy();
        // encerrar conexões pendentes
        // fechar arquivos que tenham sido abertos
        // liberar recursos que a Activity tenha passado a usar em qualquer fase do seu ciclo de vida.
        // evitar ao máximo:
            // tentar salvar o estado da aplicação,
            // fazer alguma coisa que seja crucial à Activity aqui.
    }
    @Override
    protected void onStart() {
        super.onStart();
        // aqui deve-se fazer a inicialização de componentes visuais
        // que não tenham sido inicializados no onCreate, caso ainda exista algum.
    }
    @Override
    protected void onRestart() { // esse método é chamado antes do onStart, quando outra activity devolver o 1o plano
        super.onRestart();
    }
}