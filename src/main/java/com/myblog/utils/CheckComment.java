package com.myblog.utils;

public class CheckComment {

    private static String[] badWord = { "dcm", "dm", "cac", "lol", "vc", "ngu", "lon", "shit", "fuck", "cc", "dmm", "dkm", "vl"};

    public static String invalidCmt(String comment) {

        StringBuilder sb = new StringBuilder();
        String[] s1 = comment.split("\\s");
        for (int i = 0; i < s1.length; i++) {
            for (int j = 0; j < badWord.length; j++) {
                if (s1[i].equalsIgnoreCase(badWord[j])) {
                    s1[i] = "***";
                }
            }
        }
        for (int i = 0; i < s1.length; i++) {
            sb.append(s1[i] + " ");

        }
        return sb.toString();
    }

}
