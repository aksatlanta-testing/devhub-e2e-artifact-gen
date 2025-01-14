
{{- define "go-echoe8e8db85-45a7-41f4-ad5b-d170b23641cc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe8e8db85-45a7-41f4-ad5b-d170b23641cc.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}


{{- define "go-echoe8e8db85-45a7-41f4-ad5b-d170b23641cc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe8e8db85-45a7-41f4-ad5b-d170b23641cc.labels" -}}
helm.sh/chart: {{ include "go-echoe8e8db85-45a7-41f4-ad5b-d170b23641cc.chart" . }}
{{ include "go-echoe8e8db85-45a7-41f4-ad5b-d170b23641cc.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe8e8db85-45a7-41f4-ad5b-d170b23641cc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe8e8db85-45a7-41f4-ad5b-d170b23641cc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}