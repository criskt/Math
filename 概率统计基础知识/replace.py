# -*- coding: utf-8 -*-


ori_text = r"""
\subsubsection{$\delta^{j}$}
\begin{equation}\begin{aligned}
	\delta^{j} &= (\Theta^{(j)})^T \delta^{j+1}(2:end) .* g^{'}(z^{j}) \\
	&= (\Theta^{(j)})^T \delta^{j+1}(2:end) .* g(z^{j}) .* (1-g(z^{j}))
\end{aligned}\end{equation}
\begin{enumerate}
	\item (2:end)表示舍弃第一个数据$\delta_0^{s_{L-1}}$（Matlab索引从1开始）
	\item 对比于从$a^{j}$到$a^{j+1}$要添加一个$a_0^{j}=1$；从$\delta^{j+1}$到$\delta^{j}$要舍弃一个$\delta_0^{j+1}$
	\item 同样地，此时$z^{j}$表示的是一个向量（不是矩阵）
\end{enumerate}
"""

old = 'j'
new = 'l'


def replace(ori_text, old, new):
	return ori_text.replace(old, new)


if __name__ == '__main__':
	des_text = replace(ori_text, old, new)
	print(des_text)
