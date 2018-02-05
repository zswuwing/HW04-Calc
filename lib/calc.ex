defmodule Calc do
  def main(x) do

    #x = IO.gets "Give me your prompt: (q for exit())\n"
    if x == "q" do
      IO.puts "out"
    else
      #discuss with zeng cheng and see his code
      x
      |> String.replace("+", " + ")
      |> String.replace("(", " ( ")
      |> String.replace("/", " / ")
      |> String.replace(")", " ) ")
      |> String.replace("-", " - ")
      |> String.replace("*", " * ")
      |> String.split
      |> Enum.map(fn(x) ->
        cond do
          (x == "+") || (x == "-") || (x == "*") || (x == "/") || (x == "(") || (x == ")") ->
            x
          true ->
            elem(Float.parse(x), 0)
        end
      # this part
      end)
      |>infixToPostFix([],[])

    end
  end

  # discuss with zeng Cheng
  def eval(fomual, stack1) do

    cond do
      Enum.empty?(fomual) ->
        hd(stack1)
      true ->
        [head|reminding] = fomual
        cond do
          is_number(head) ->
            eval(reminding, [head] ++ stack1)
          true ->
            [second,first|tail] = stack1
            case head do
              "+" ->
                eval(reminding, [first + second] ++ tail)
              "-" ->
                eval(reminding, [first - second] ++ tail)
              "*" ->
                eval(reminding, [first * second] ++ tail)
              "/" ->
                eval(reminding, [first / second] ++ tail)
            end
        end
    end
  end


  def infixToPostFix(fomual,stack1,postfix) do
    cond do
      Enum.empty?(fomual) ->

        postfix ++ stack1

        |> eval([])
      true ->
        [head|reminding] = fomual
        cond do
          is_number(head) ->
            infixToPostFix(reminding, stack1, postfix ++ [head])

          true ->
            cond do
              head == "(" ->
                infixToPostFix(reminding, [head] ++ stack1, postfix)
              head == ")" ->
                [h|tail] = stack1
                cond do
                   h == "(" ->
                     infixToPostFix(reminding, tail, postfix)
                   true ->
                     infixToPostFix(fomual, tail, postfix ++ [h])
                end
              true ->
                cond do
                  Enum.empty?(stack1) ->
                    infixToPostFix(reminding, [head] ++ stack1, postfix)
                  true ->
                    [h|tail] = stack1
                    cond do
                      (head == "*") or (head == "/") ->
                        cond do
                          (h == "*") or (h == "/") ->
                            infixToPostFix(fomual, tail, postfix ++ [h])
                          h == "(" ->
                            infixToPostFix(reminding, [head] ++ stack1, postfix)
                          true ->
                            infixToPostFix(reminding, [head] ++ stack1, postfix)
                        end
                      true ->
                        cond do
                          h == "(" ->
                            infixToPostFix(reminding, [head] ++ stack1, postfix)
                          true ->
                            infixToPostFix(fomual, tail, postfix ++ [h])
                        end


                    end


                end
            end
        end
    end
end
end
