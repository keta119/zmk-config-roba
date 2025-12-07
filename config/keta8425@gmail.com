#include <behaviors.dtsi>
#include <dt-bindings/zmk/bt.h>
#include <dt-bindings/zmk/keys.h>
#include <dt-bindings/zmk/pointing.h>

&mt {
    flavor = "balanced";
    quick-tap-ms = <0>;
};

&trackball {
    // automouse-layer = <4>;

    scroll-layers = <5>;

    // arrows {
    //     layers = <3>;
    //     bindings =
    //         <&kp RIGHT_ARROW>,
    //         <&kp LEFT_ARROW>,
    //         <&kp UP_ARROW>,
    //         <&kp DOWN_ARROW>;
    //     tick = <10>;
    //     wait-ms = <5>;
    //     tap-ms = <5>;
    // };
};

/ {
    combos { compatible = "zmk,combos"; };

    macros {
    };

    behaviors {
        lt_to_layer_0: lt_to_layer_0 {
            compatible = "zmk,behavior-hold-tap";
            label = "LAYER_TAP_TO_0";
            bindings = <&mo>, <&to_layer_0>;
            #binding-cells = <1>;　
　　　　　
bindings = <0>;
            tapping-term-ms = <200>;
        };

        icloud: icloud {
            compatible = "zmk,behavior-macro";
            #binding-cells = <0>;
            bindings = <&kp LANGUAGE_2 &kp LS(F) &kp I &kp R &kp E &kp LS(NUMBER_2) &kp KP_NUMBER_1 &kp KP_NUMBER_1 &kp N9 &kp LS(NUMBER_2) &kp LS(N8) &kp K &kp E &kp T &kp LS(A) &kp LS(N9) &kp RET>;
            label = "ICLOUD";
        };

        LOGIN: LOGIN {
            compatible = "zmk,behavior-macro";
            #binding-cells = <0>;
            bindings = <&kp LANG2 &kp KP_NUMBER_5 &kp KP_NUMBER_1 &kp KP_NUMBER_6 &kp LS(F) &kp I &kp R &kp E &kp LBKT &kp ENTER>;
            label = "LOGIN";
        };

        SHOKUIN: SHOKUIN {
            compatible = "zmk,behavior-macro";
            #binding-cells = <0>;
            bindings = <&kp LANGUAGE_2 &kp F &kp I &kp M &kp S &kp KP_NUMBER_2 &kp KP_NUMBER_4 &kp KP_NUMBER_1 &kp KP_NUMBER_7 &kp RET>;
            label = "SHOKUIN";
        };

        KOUSEI: KOUSEI {
            compatible = "zmk,behavior-macro";
            #binding-cells = <0>;
            bindings = <&kp LANGUAGE_2 &kp S &kp T &kp S &kp H &kp KP_NUMBER_5 &kp KP_NUMBER_0 &kp KP_NUMBER_5 &kp KP_NUMBER_8 &kp RET>;
            label = "KOUSEI";
        };

        MENKYO: MENKYO {
            compatible = "zmk,behavior-macro";
            #binding-cells = <0>;
            bindings = <&kp LANGUAGE_2 &kp M &kp E &kp N &kp K &kp Y &kp O &kp RET>;
            label = "MENKYO";
        };

        ADDTIMEDATE: ADDTIMEDATE {
            compatible = "zmk,behavior-macro";
            #binding-cells = <0>;
            bindings = <&kp KP_SLASH &kp KP_SLASH &kp KP_DIVIDE &kp KP_SLASH &kp KP_DIVIDE &kp KP_DIVIDE &kp KP_DIVIDE &kp KP_DIVIDE &kp KP_DIVIDE &kp F5 &kp KP_DIVIDE &kp KP_DIVIDE &kp KP_DIVIDE &kp KP_DIVIDE &kp KP_DIVIDE &kp KP_DIVIDE &kp KP_DIVIDE &kp KP_DIVIDE &kp KP_DIVIDE>;
            label = "ADDTIMEDATE";
        };

        kakko: kakko {
            compatible = "zmk,behavior-macro";
            #binding-cells = <0>;
            bindings = <&kp LANGUAGE_1 &kp LS(N8) &kp LS(N9) &kp LEFT>;
            label = "KAKKO";
        };

        kagikakko: kagikakko {
            compatible = "zmk,behavior-macro";
            #binding-cells = <0>;
            bindings = <&kp LANGUAGE_1 &kp RIGHT_BRACKET &kp BACKSLASH &kp LEFT>;
            label = "KAGIKAKKO";
        };

        Fire119: Fire119 {
            compatible = "zmk,behavior-macro";
            #binding-cells = <0>;
            bindings = <&kp LANGUAGE_2 &kp LS(F) &kp I &kp R &kp E &kp NUMBER_1 &kp KP_NUMBER_1 &kp N9 &kp MINUS &kp RET>;
            label = "FIRE119";
        };
    };

    keymap {
        compatible = "zmk,keymap";

        default_layer {
            bindings = <
&lt 6 Q         &kp W         &kp E         &kp R        &kp T                                               &kp Y        &kp U  &lt 5 I   &kp O     &kp P
&kp A           &kp S         &kp D         &kp F        &kp G        &kp LS(LG(S))         &kp MINUS        &kp H        &kp J  &kp K     &kp L     &lt 5 MINUS
&kp Z           &kp X         &kp C         &kp V        &kp B        &kp LEFT_CONTROL      &kp LEFT_SHIFT   &kp N        &kp M  &mkp MB1  &mkp MB2  &kp SLASH
&kp LEFT_SHIFT  &kp LEFT_WIN  &kp LEFT_ALT  &lt 5 LANG2  &lt 4 SPACE  &lt 3 LANG1           &lt 3 BACKSPACE  &lt 4 ENTER                             &kp RCTRL
            >;
        };

        FUNCTION {
            bindings = <
&trans  &trans  &trans  &trans  &trans                       &kp F1  &kp F2  &kp F3     &kp F4      &kp F5
&trans  &trans  &trans  &trans  &trans  &trans      &kp F13  &kp F6  &kp F7  &kp F8     &kp F9      &kp F10
&trans  &trans  &trans  &trans  &trans  &trans      &trans   &trans  &trans  &kp COMMA  &kp PERIOD  &kp F11
&trans  &trans  &trans  &trans  &trans  &trans      &trans   &trans                                 &kp F12
            >;
        };

        NUM {
            bindings = <
&kp F1        &kp F2   &kp F3   &kp F4    &kp F5                                     &kp KP_MULTIPLY   &kp KP_NUMBER_7  &kp KP_NUMBER_8  &kp KP_NUMBER_9  &kp KP_NUM
&kp F6        &kp F7   &kp F8   &kp F9    &kp F10  &trans             &kp KP_DIVIDE  &kp SINGLE_QUOTE  &kp KP_NUMBER_4  &kp KP_NUMBER_5  &kp KP_N6        &kp KP_MINUS
&ADDTIMEDATE  &MENKYO  &KOUSEI  &SHOKUIN  &LOGIN   &Fire119           &trans         &kp KP_N1         &kp KP_N1        &kp KP_N2        &kp KP_N3        &kp KP_PLUS
&icloud       &trans   &trans   &trans    &trans   &kp BACKSPACE      &kp KP_DOT     &kp KP_N0                                                            &kp LS(MINUS)
            >;
        };

        ARROW {
            bindings = <
&kp F1        &kp F2   &kp F3   &kp F4    &kp F5                                     &kp KP_MULTIPLY   &kp KP_NUMBER_7  &kp KP_NUMBER_8  &kp KP_NUMBER_9  &kp KP_NUM
&kp F6        &kp F7   &kp F8   &kp F9    &kp F10  &trans             &kp KP_DIVIDE  &kp SINGLE_QUOTE  &kp KP_NUMBER_4  &kp KP_NUMBER_5  &kp KP_N6        &kp KP_MINUS
&ADDTIMEDATE  &MENKYO  &KOUSEI  &SHOKUIN  &LOGIN   &Fire119           &trans         &kp KP_N1         &kp KP_N1        &kp KP_N2        &kp KP_N3        &kp KP_PLUS
&icloud       &trans   &trans   &trans    &trans   &kp BACKSPACE      &kp KP_DOT     &kp KP_N0                                                            &kp LS(MINUS)
            >;
        };

        MOUSE {
            bindings = <
&kp ESCAPE      &kp AT_SIGN  &kp RIGHT_BRACKET      &kp BACKSLASH      &kp GRAVE                               &kp LS(NUMBER_1)  &kp LS(NUMBER_2)  &kp LS(NUMBER_3)  &kp LS(NUMBER_4)     &kp LS(N5)
&kp TAB         &kp TILDE    &kp LS(N8)             &kp LS(N9)         &kp SEMI           &trans      &trans   &kp LS(SLASH)     &kakko            &kagikakko        &kp INTERNATIONAL_3  &kp LS(INTERNATIONAL_1)
&trans          &trans       &kp LS(RIGHT_BRACKET)  &kp LS(BACKSLASH)  &kp SINGLE_QUOTE   &trans      &trans   &kp LS(NUMBER_6)  &kp LS(NUMBER_2)  &kp COMMA         &kp PERIOD           &kp LEFT_BRACKET
&kp LEFT_SHIFT  &trans       &trans                 &kp LC(PG_UP)      &kp LC(PAGE_DOWN)  &trans      &kp DEL  &trans                                                                     &trans
            >;
        };

        SCROLL {
            bindings = <
&kp LA(F4)    &trans         &kp LA(LEFT_ARROW)  &kp LA(RIGHT)  &kp LS(LG(S))                                 &kp PG_UP      &kp HOME        &kp UP_ARROW    &kp LG(TAB)      &kp LG(D)
&kp LG(LEFT)  &kp LG(RIGHT)  &kp LA(O)           &kp LC(F)      &kp RCTRL      &trans      &kp LC(PAGE_DOWN)  &kp PAGE_DOWN  &kp LEFT_ARROW  &kp DOWN_ARROW  &kp RIGHT_ARROW  &trans
&kp LC(Z)     &kp LC(X)      &kp LC(C)           &kp LC(V)      &trans         &trans      &kp LC(PG_UP)      &kp END        &mkp MB3        &mkp MB1        &mkp MB2         &trans
&trans        &kp LG(L)      &kp LC(LA(DELETE))  &trans         &trans         &trans      &kp BACKSPACE      &kp DELETE                                                      &trans
            >;
        };

        layer_6 {
            bindings = <
&trans  &trans  &trans  &trans  &trans                           &bt BT_SEL 0  &bt BT_SEL 1  &bt BT_SEL 2  &bt BT_SEL 3  &bt BT_SEL 4
&trans  &trans  &trans  &trans  &trans  &trans      &bootloader  &bootloader   &trans        &trans        &trans        &trans
&trans  &trans  &trans  &trans  &trans  &trans      &bootloader  &trans        &trans        &trans        &trans        &bt BT_CLR
&trans  &trans  &trans  &trans  &trans  &trans      &trans       &trans                                                  &bt BT_CLR_ALL
            >;
        };

        layer_7 {
            bindings = <
&trans  &trans  &trans  &trans  &trans                      &trans  &trans  &trans  &trans  &trans
&trans  &trans  &trans  &trans  &trans  &trans      &trans  &trans  &trans  &trans  &trans  &trans
&trans  &trans  &trans  &trans  &trans  &trans      &trans  &trans  &trans  &trans  &trans  &trans
&trans  &trans  &trans  &trans  &trans  &trans      &trans  &trans                          &trans
            >;
        };

        layer_8 {
            bindings = <
&trans  &trans  &trans  &trans  &trans                      &trans  &trans  &trans  &trans  &trans
&trans  &trans  &trans  &trans  &trans  &trans      &trans  &trans  &trans  &trans  &trans  &trans
&trans  &trans  &trans  &trans  &trans  &trans      &trans  &trans  &trans  &trans  &trans  &trans
&trans  &trans  &trans  &trans  &trans  &trans      &trans  &trans                          &trans
            >;
        };
    };
};
