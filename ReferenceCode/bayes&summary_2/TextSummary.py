# -*- coding:utf-8 -*-
from snownlp import SnowNLP
import sys
reload(sys)
sys.setdefaultencoding('utf-8')


def TextSummary(input):
    """
        新闻文本摘要函数
    """
    textSummary = ""
    text = unicode(input)
    s = SnowNLP(text)
    mainText = s.summary(3)
    for texts in mainText:
        text = texts.encode("utf-8")
        textSummary = textSummary + text + ";"
    return textSummary


text = "3月8日上午，对于北青报记者关于柳城爆炸案的提问，柳州市委书记郑俊康表示，今天不谈这个事情，已经处理完了。被问及从中吸取的教训以及之后采取的措施，他称“有的不需要对外宣传”。有记者询问关于柳州溺亡市长肖文荪的问题，郑俊康表示他肯定是选择了自己走的路了，秘书当时在场而且还需要自己翻过栏杆。至于肖文荪为什么选择这条路，到现在也没有证据说明原因。郑俊康同时称，可以负责任的说，关于肖文荪溺亡，到目前为止，没有反腐的问题。"
print TextSummary(text)
